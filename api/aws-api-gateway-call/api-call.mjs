import axios from "axios"

const http = axios.create({
  baseURL: 'https://ed50zsby74.execute-api.ap-southeast-1.amazonaws.com/v1',
  timeout: 1000,
  headers: {'x-api-key': 'T8lMz6YVwwrAwg8ItPsV66KeQgoSZmN12hqPKrKb'}
});

export function sendRequest(){
    http.get('/lambda2', {
        params: {
          id: 10,
          name: 'Gehan'
        }}).then(function (response) {
          console.log(response.data);
          console.log(response.status);
          console.log(response.statusText);
          console.log(response.headers);
          console.log(response.config);;
        }) .catch(function (error) {
          console.log(error);
        });
        //console.log('Request sent...>');
      
      /* export function getUser(userId: string) {
        console.log('Request sent...>');
        // An equivalent to `GET /users?id=12345`
        return http.get('/lambda1', {
          params: {
            id: 12345
          }
        });
      } */
}
