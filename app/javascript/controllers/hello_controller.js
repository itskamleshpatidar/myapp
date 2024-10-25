import { Controller } from "@hotwired/stimulus"
// import axios from "axios"

export default class extends Controller {
  static targets = ["result"];

  fetchData() {
    debugger
    axios
    .get("https://jsonplaceholder.typicode.com/posts/1")
    .then((response) => {
        debugger
        this.resultTarget.innerText = JSON.stringify(response.data, null, 2);
      })
      .catch((error) => {
        debugger
        console.error(error);
        this.resultTarget.innerText = "Error fetching data";
      });
  }
}