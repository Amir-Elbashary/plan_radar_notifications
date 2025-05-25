# frozen_string_literal: true

json.extract! ticket,
              :id, :user_id, :title, :description,
              :status_id, :progress, :due_date,
              :created_at, :updated_at
