class TasksController < ApplicationController
  # POST /tasks
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.user_id == current_user.id && @task.save
        format.js
      else
        format.js { render "shared/failure", locals: { messages: @task.errors.full_messages } }
      end
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    if @task.user_id == current_user.id
      direction = params[:direction].to_i

      if direction != 0
        tasks_to_change = @task.tasks_for_rank_change(direction)
        if tasks_to_change.respond_to?(:each)
          @task.rank = @task.rank + direction
          tasks_to_change.each do |task|
            curr_task = Task.find(task.id)
            curr_task.rank = curr_task.rank - direction
            curr_task.save
          end
        end
      end

      respond_to do |format|
        if @task.update_attributes(params[:task])
          format.js
        else
          format.js { render "shared/failure", locals: { messages: @task.errors.full_messages } }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy if @task.user_id == current_user.id

    respond_to do |format|
      format.js
    end
  end
end
