
import Text "mo:base/Text";
import Http "mo:http/Http";

actor ImageSearch {
  public func searchForImage(imageUrl : Text) : async [Text] {
    let apiKey = "YOUR_API_KEY";
    let searchEngineId = "YOUR_SEARCH_ENGINE_ID";
    let url = "https://www.googleapis.com/customsearch/v1?key=" # apiKey # "&cx=" # searchEngineId # "&searchType=image&imgUrl=" # imageUrl;


    let response = await Http.request {
      url = url;
      method = Http.Method.GET;
      headers = [];
      body = null;
    };

    if (response) {
      let response = response;
      let data = response.body;
      return processSearchResults(data);
    } else {
      return [];
    }
  };


};