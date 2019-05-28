class CandidatesController < ApplicationController
    def index
        @candidates = Candidate.all
    end
    def show
        @candidate = Candidate.find_by(id: params[:id])
    end
    def new
        @candidate = Candidate.new
    end
    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            redirect_to root_path, notice:'新增成功'
        else
            render :new, notice: '新增失敗'
        end
    end
    def edit
        @candidate = Candidate.find_by(id: params[:id])
    end
    def update
        @candidate = Candidate.find_by(id: params[:id])
        
        if @candidate.update(candidate_params)
            redirect_to root_path,notice: '更新成功'
        else
            render :edit
        end
    end
    def vote
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.increment(:votes)
        @candidate.save
        redirect_to root_path, notice: '投票成功！！'
    end
    def destroy
        @candidate = Candidate.find_by(id: params[:id])
        
        @candidate.destroy
        redirect_to root_path, notice: '刪除成功！！'
        
    end
    private
    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :platform)
    end
end
