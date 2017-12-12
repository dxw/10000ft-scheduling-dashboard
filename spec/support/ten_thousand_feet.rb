module TenThousandFeet
  def stub_ten_thousand_feet_client(client: double)
    allow(TenThousandFeet).to receive(:new).and_return(client)
  end

  def stub_ten_thousand_feet_project_response(client:)
    allow(client).to receive(:get_projects).and_return(EMPTY_PROJECT_RESPONSE)
  end

  def stub_ten_thousand_feet_user_response(client:)
    allow(client).to receive(:get_project_users).and_return(EMPTY_USER_RESPONSE)
  end

  EMPTY_PROJECT_RESPONSE = {"paging"=>
      {"per_page"=>20,
       "page"=>1,
       "previous"=>nil,
       "self"=>"/api/v1/projects?&page=1",
       "next"=>nil,
       "count"=>12},
     "data"=>[]}.freeze

  PROJECT_RESPONSE = {"paging"=>
      {"per_page"=>20,
       "page"=>1,
       "previous"=>nil,
       "self"=>"/api/v1/projects?&page=1",
       "next"=>nil,
       "count"=>12},
     "data"=>
      [{"id"=>1724065,
        "archived"=>false,
        "archived_at"=>nil,
        "description"=>nil,
        "guid"=>"45354fc3-c379-4b61-bd12-5934f7d04796",
        "name"=>"Essex",
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
        "client"=>"Essex CC",
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
      }.freeze

  EMPTY_USER_RESPONSE = {"paging"=>
      {"per_page"=>20,
       "page"=>1,
       "previous"=>nil,
       "self"=>
        "/api/v1/projects/1724070/users?project_id=1724070&page=1",
       "next"=>nil},
     "data"=>[]
   }.freeze

  USER_RESPONSE = {"paging"=>
      {"per_page"=>20,
       "page"=>1,
       "previous"=>nil,
       "self"=>
        "/api/v1/projects/1724070/users?project_id=1724070&page=1",
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
        "thumbnail"=>""}
      ]
    }.freeze
end
