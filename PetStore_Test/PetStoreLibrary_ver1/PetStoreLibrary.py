# Custom library for Swagger Petstore sample website

import requests
import json


class PetStoreLibrary:

    def __init__(self):
        self.base_url = "https://petstore.swagger.io/v2"

    def create_user(self, user):  # POST
        headers = {"Content-Type": "application/json"}
        url = f"{self.base_url}/user"
        response = requests.post(url, headers=headers, data=json.dumps(user))
        return response.json()

    def update_user(self, username, user):  # PUT
        headers = {"Content-Type": "application/json"}
        url = f"{self.base_url}/user/{username}"
        response = requests.put(url, headers=headers, data=json.dumps(user))
        return response.json()

    def get_user_by_username(self, username):  # GET
        url = f"{self.base_url}/user/{username}"
        response = requests.get(url)
        return response.json()

    def delete_user(self, username):  # DELETE
        url = f"{self.base_url}/user/{username}"
        response = requests.delete(url)
        return response.json()
