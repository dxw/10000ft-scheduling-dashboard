module TenThousandFeetStubs
  def stub_ten_thousand_feet_client(client: double)
    allow(TenThousandFeetWrapper).to receive(:client).and_return(client)
  end

  def stub_ten_thousand_feet_project_response(client:)
    allow(client).to receive(:get_projects)
      .with(anything)
      .and_return(TenThousandFeetStubs.empty_project_response)
  end

  def stub_ten_thousand_feet_user_response(client:)
    allow(client).to receive(:get_users)
      .with(anything)
      .and_return(TenThousandFeetStubs.empty_user_response)
  end

  def stub_ten_thousand_feet_assignment_response(client:)
    allow(client).to receive(:get_assignments)
      .with(anything, anything)
      .and_return(TenThousandFeetStubs.empty_assignment_response)
  end

  def stub_ten_thousand_feet_leave_types_response(client:)
    allow(client).to receive(:get_leave_types)
      .with(anything)
      .and_return(TenThousandFeetStubs.empty_leave_types_response)
  end

  def stub_ten_thousand_feet_project_users_response(client:)
    allow(client).to receive(:get_project_users)
      .with(anything, anything)
      .and_return(TenThousandFeetStubs.empty_project_users_response)
  end

  def self.empty_leave_types_response
    {"paging"=>
    {"per_page"=>500,
      "page"=>1,
      "previous"=>nil,
      "self"=>"/api/v1/leave_types?per_page=500&page=1",
      "next"=>nil},
      "data"=>
      []}
  end

  def self.leave_types_response(project_id: 1727573, name: 'Sick')
    {"paging"=>
    {"per_page"=>500,
      "page"=>1,
      "previous"=>nil,
      "self"=>"/api/v1/leave_types?per_page=500&page=1",
      "next"=>nil},
      "data"=>
      [{"id"=>project_id,
        "description"=>nil,
        "guid"=>"ec94285b-3dff-4275-a736-0a151e0060f3",
        "name"=>name,
        "deleted_at"=>nil,
        "created_at"=>"2017-12-13T13:28:08Z",
        "updated_at"=>"2017-12-13T13:28:08Z",
        "type"=>"LeaveType"}]}
  end

  def self.empty_project_response
    {"paging"=>
    {"per_page"=>20,
     "page"=>1,
     "previous"=>nil,
     "self"=>"/api/v1/projects?&page=1",
     "next"=>nil,
     "count"=>12},
     "data"=>[]}
   end

  def self.project_response(project_id: 8370190, name: 'NHS')
    {"paging"=>
      {"per_page"=>20,
       "page"=>1,
       "previous"=>nil,
       "self"=>"/api/v1/projects?&page=1",
       "next"=>nil,
       "count"=>12},
     "data"=>
      [{"id"=>project_id,
        "archived"=>false,
        "archived_at"=>nil,
        "description"=>nil,
        "guid"=>"45354fc3-c379-4b61-bd12-5934f7d04796",
        "name"=>name,
        "parent_id"=>nil,
        "phase_name"=>nil,
        "project_code"=>"",
        "secureurl"=>nil,
        "secureurl_expiration"=>nil,
        "settings"=>0,
        "timeentry_lockout"=>-1,
        "ends_at"=>"2017-12-11",
        "starts_at"=>"2017-12-11",
        "deleted_at"=>nil,
        "created_at"=>"2017-12-11T15:18:09Z",
        "updated_at"=>"2017-12-11T15:18:09Z",
        "use_parent_bill_rates"=>false,
        "thumbnail"=>nil,
        "type"=>"Project",
        "has_pending_updates"=>false,
        "client"=>"NHS",
        "project_state"=>"Tentative",
        "tags"=>
         {"paging"=>
           {"self"=>
             "/api/v1/projects/1724065/tags?per_page=0&page=1",
            "next"=>nil,
            "previous"=>nil,
            "page"=>1,
            "per_page"=>0},
          "data"=>[]}}
        ]
      }
    end

  def self.empty_user_response
    {"paging"=>
    {"per_page"=>20,
     "page"=>1,
     "previous"=>nil,
     "self"=>"/api/v1/users?&page=1",
     "next"=>"/api/v1/users?&page=2"},
     "data"=>[]}
  end

  def self.user_response(user_id: 123, first_name: 'Alex')
    {"paging"=>
    {"per_page"=>20,
    "page"=>1,
    "previous"=>nil,
    "self"=>"/api/v1/users?&page=1",
    "next"=>"/api/v1/users?&page=2"},
    "data"=>
    [{"id"=>user_id,
      "first_name"=>first_name,
      "last_name"=>"Doe",
      "archived"=>false,
      "display_name"=>'Alex Doe',
      "email"=>"alex@dxw.com",
      "user_type_id"=>1,
      "billable"=>true,
      "hire_date"=>nil,
      "termination_date"=>nil,
      "mobile_phone"=>nil,
      "office_phone"=>nil,
      "deleted_at"=>nil,
      "deleted"=>false,
      "account_owner"=>true,
      "invitation_pending"=>false,
      "user_settings"=>590053,
      "guid"=>"885d98f5-2831-4634-99b0-cf23e5623e8c",
      "employee_number"=>nil,
      "billability_target"=>100.0,
      "billrate"=>-1.0,
      "role"=>nil,
      "discipline"=>"Development",
      "location"=>nil,
      "type"=>"User",
      "created_at"=>"2017-12-07T12:08:03Z",
      "updated_at"=>"2017-12-12T09:58:58Z",
      "has_login"=>true,
      "login_type"=>"default",
      "archived_at"=>nil,
      "thumbnail"=>"https://yyy.cloudfront.net/xxx/xxx.jpg"}]
    }
  end

  def self.empty_assignment_response
    {"paging"=>
    {"per_page"=>20,
     "page"=>1,
     "previous"=>nil,
     "self"=>"/api/v1/users/389604/assignments?user_id=389604&page=1",
     "next"=>nil},
     "data"=>[]
    }
  end

  def self.assignment_response(project_id: 8370190, user_id: 389604, starts_at: '2017-12-11', ends_at: '2050-12-19')
    {"paging"=>
    {"per_page"=>20,
     "page"=>1,
     "previous"=>nil,
     "self"=>"/api/v1/users/389604/assignments?user_id=389604&page=1",
     "next"=>nil},
     "data"=>
     [{"id"=>182473562,
        "allocation_mode"=>"percent",
        "percent"=>1.0,
        "user_id"=>user_id,
        "assignable_id"=>project_id,
        "ends_at"=>ends_at,
        "starts_at"=>starts_at,
        "bill_rate"=>1.0,
        "bill_rate_id"=>24799817,
        "repetition_id"=>nil,
        "created_at"=>"2017-12-11T16:09:26Z",
        "updated_at"=>"2017-12-11T16:09:39Z",
        "all_day_assignment"=>true,
        "resource_request_id"=>nil,
        "status"=>nil}
      ]
    }
  end

  def self.empty_project_users_response
    {"paging"=>
    {"per_page"=>20,
     "page"=>1,
     "previous"=>nil,
     "self"=>"/api/v1/projects/1724070/users?project_id=1724070&page=1",
     "next"=>nil},
     "data"=>
     []}
  end

  def self.project_users_response
    {"paging"=>
    {"per_page"=>20,
     "page"=>1,
     "previous"=>nil,
     "self"=>"/api/v1/projects/1724070/users?project_id=1724070&page=1",
     "next"=>nil},
     "data"=>
      [{"id"=>389604,
        "first_name"=>"Poss",
        "last_name"=>"Apostolou",
        "archived"=>false,
        "display_name"=>"Poss Apostolou",
        "email"=>"",
        "user_type_id"=>3,
        "billable"=>true,
        "hire_date"=>nil,
        "termination_date"=>nil,
        "mobile_phone"=>nil,
        "office_phone"=>nil,
        "deleted_at"=>nil,
        "deleted"=>false,
        "account_owner"=>false,
        "invitation_pending"=>false,
        "user_settings"=>0,
        "guid"=>"a9e1aec0-89e2-4ed5-a0cf-2456ef206946",
        "employee_number"=>nil,
        "billability_target"=>100.0,
        "billrate"=>-1.0,
        "role"=>"Head of",
        "discipline"=>"Business",
        "location"=>nil,
        "type"=>"User",
        "created_at"=>"2017-12-11T15:36:10Z",
        "updated_at"=>"2017-12-11T15:50:44Z",
        "has_login"=>false,
        "login_type"=>nil,
        "archived_at"=>nil,
        "thumbnail"=>""}]
      }
  end
end
