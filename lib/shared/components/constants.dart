const baseUrl = 'https://newsapi.org/';
const method = 'v2/top-headlines';
const methodOfSearch= 'v2/everything';

Map<String,dynamic> queryOfAllData={
'country': 'eg',
'apiKey':'124bf41624074b1892a9f51405db4479'
};

 Map<String,dynamic> queryOfSportsData={
  'country': 'eg',
  'category':'sports',
  'apiKey':'a6f4ecb307354436b4001fda99256018',
};

Map<String,dynamic> queryOfBusinessData={
  'country': 'eg',
  'category':'business',
  'apiKey':'a6f4ecb307354436b4001fda99256018'
};

Map<String,dynamic> queryOfScienceData={
  'country': 'eg',
  'category':'science',
  'apiKey':'a6f4ecb307354436b4001fda99256018'
};


Map<String,dynamic> queryOfHealthData={
  'country': 'eg',
  'category':'health',
  'apiKey':'a6f4ecb307354436b4001fda99256018'
};

Map<String,dynamic> queryOfTechnologyData ={
  'country': 'eg',
  'category':'technology',
  'apiKey':'a6f4ecb307354436b4001fda99256018'
};



//q=Apple&from=2022-05-20&sortBy=popularity&apiKey=API_KEY