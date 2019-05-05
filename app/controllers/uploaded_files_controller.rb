class UploadedFilesController < ApplicationController
  before_action :set_uploaded_file, only: [:show, :edit, :update, :destroy, :schedule_slots, :export_schedule]

  # GET /uploaded_files
  # GET /uploaded_files.json
  def index
    @uploaded_files = UploadedFile.all
  end

  # GET /uploaded_files/1
  # GET /uploaded_files/1.json
  def show
  end

  # GET /uploaded_files/new
  def new
    @uploaded_file = UploadedFile.new
  end

  # GET /uploaded_files/1/edit
  def edit
  end

  # POST /uploaded_files
  # POST /uploaded_files.json
  def create
    @uploaded_file = UploadedFile.new(file_name: params[:uploaded_file][:file_name].original_filename)
    respond_to do |format|
      if @uploaded_file.save
        load_imported_items
        format.html { redirect_to root_path, notice: 'Uploaded file was successfully created.' }
        format.json { render :show, status: :created, location: @uploaded_file }
      else
        format.html { render :new }
        format.json { render json: @uploaded_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploaded_files/1
  # PATCH/PUT /uploaded_files/1.json
  def update
    respond_to do |format|
      if @uploaded_file.update(uploaded_file_params)
        format.html { redirect_to @uploaded_file, notice: 'Uploaded file was successfully updated.' }
        format.json { render :show, status: :ok, location: @uploaded_file }
      else
        format.html { render :edit }
        format.json { render json: @uploaded_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploaded_files/1
  # DELETE /uploaded_files/1.json
  def destroy
    @uploaded_file.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Uploaded file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def open_spreadsheet
    file = params[:uploaded_file][:file_name]
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_items
    spreadsheet = open_spreadsheet
    (2..spreadsheet.last_row).map do |i|
      record = spreadsheet.row(i)
      @uploaded_file.file_records.create(timing:record[0], class_name:record[2], slot: record[1])

    end
  end

  def schedule_slots
    @uploaded_file.file_records.update_all(invigilator_id: nil)
    @uploaded_file.file_records.group_by(&:timing).each do |key, values|
      lab_engineer = [0]
      associate = [0]
      lecturer = [0]
      assistant = [0]
      values.each do |value|
        done = 0
        @uploaded_file.file_records.where
        lab_engineer_records = Invigilator.all.where(invigilator_type: "lab_engineer").where.not("id IN (?)", lab_engineer)
        associate_records = Invigilator.all.where(invigilator_type: "associate").where.not("id IN (?)", associate)
        lecturer_records = Invigilator.all.where(invigilator_type: "lecturer").where.not("id IN (?)", lecturer)
        assistant_records = Invigilator.all.where(invigilator_type: "assistant").where.not("id IN (?)", assistant)



        if lab_engineer_records.count > 0 && done == 0
          
          eng_done = 0
          lab_engineer_records.each do |eng|
            if @uploaded_file.file_records.where(invigilator_id: eng.id).count < 7 && eng_done == 0
              value.update_column(:invigilator_id, eng.id)  
              lab_engineer << eng.id
              eng_done = 1
              done = 1
            end
          end
        end

        if assistant_records.count > 0 && done == 0
          assistant_done = 0
          assistant_records.each do |asi|
            if @uploaded_file.file_records.where(invigilator_id: asi.id).count < 5 && assistant_done == 0
              value.update_column(:invigilator_id, asi.id)  
              assistant << asi.id
              assistant_done = 1
              done = 1
            end
          end
        end

        if lecturer_records.count > 0 && done == 0
          lecturer_done = 0
          lecturer_records.each do |lec|
            if @uploaded_file.file_records.where(invigilator_id: lec.id).count < 4 && lecturer_done == 0
              value.update_column(:invigilator_id, lec.id)  
              lecturer << lec.id
              lecturer_done = 1
              done = 1
            end
          end
        end

        if associate_records.count > 0 && done == 0
          associate_done = 0
          associate_records.each do |aso|
            if @uploaded_file.file_records.where(invigilator_id: aso.id).count < 3 && associate_done == 0
              value.update_column(:invigilator_id, aso.id)  
              associate << aso.id
              associate_done = 1
              done = 1
            end
          end
        end
      end

    end
    respond_to do |format|
      format.html { redirect_to uploaded_file_path(@uploaded_file), notice: 'Uploaded file was successfully updated.' }
    end
  end

  def export_schedule
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="schedule_slots.xlsx"'
      }
      format.html { redirect_to :root_path }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uploaded_file
      @uploaded_file = UploadedFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uploaded_file_params
      params.require(:uploaded_file).permit(:file_name)
    end
end
