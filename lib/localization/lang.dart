
class Language {
 
 final int id ;
 final String name ;
 final String flag ;
 final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);


 static List <Language> langList(){
   
   return <Language> [
     Language(1, "English", "πΊπΈ", "en"),
     Language(2, "Arabic", "πͺπ¬", "ar")

   ];
     
 }



}