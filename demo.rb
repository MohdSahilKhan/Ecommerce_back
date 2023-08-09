/bank_details/{user_id}:
       get:
      summary: Show bank details.
       tags:
         - Bank details API
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                user:
                  type: object
                  properties:
                    reset_password_token:
                      type: string
                    password:
                      type: string
                    password_confirmation:
                      type: string
      parameters:
        - name: user_id
          in: path
          description: User-id of the Bank
          required: true
          schema:
            type: integer
      responses:
        '201':
          description: Created     
  # /bank_details/{id}:
    get:
      summary: See bank details
        '200':
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  bank_detail:
                    type: object
                    properties:
                      account_name:
                        type: string
                      account_number:
                        type: string
                      ifsc:
                        type: string
                      cancelled_cheque:
                        type: string
                      user_id:
                        type: integer
                        format: int64
          

    put:
      summary: Update Bank Details.
      tags:
        - Bank details API
      parameters:
        - name: user_id
          in: path
          description: User-id to update bank details 
          required: true
          schema:
            type: integer
      requestBody:
        required: true
        content:
       paths:
             schema:
               type: object
               properties:
                user:
                bank_details:
                  type: object
                  properties:
                    reset_password_token:
                    account_name:
                      type: string
                    password:
                    account_number:
                      type: string
                    password_confirmation:
                    ifsc:
                      type: string
      responses:
                    cancelled_cheque:
                      type: string

      responses: 
        '201':
          description: Created
      
  # /bank_details/{id}:
          description: Created 
    delete:
      summary: Delete bank details
      summary: delete Bank Details.
      tags:
        - Bank details API
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                user:
                  type: object
                  properties:
                    reset_password_token:
                      type: string
                    password:
                      type: string
                    password_confirmation:
                      type: string
      responses:
      parameters:
        - name: user_id
          in: path
          description: User-id of the bank detail to delete
          required: true
          schema:
            type: integer
      responses: 
        '201':
          description: Created


  