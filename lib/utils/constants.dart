class Constants {

  static String server = "http://sanrachna.pythonanywhere.com/api/";

  /// Associate APIs
  static String labourAssociateAPI = "$server + associate/labour/";
  static String supervisorAssociateAPI = "$server + associate/supervisor/";
  static String vendorAssociateAPI = "$server + associate/vendor/";

  static String prospectAPI = "$server + prospect/list/";
  static String materialTilesAPI = "$server + database/material/tiles/";
  static String serviceAPI = "$server + database/service/";

  /// Clientele APIs
  static String clientClienteleAPI = "$server + admin/clientele/client/";
  static String leadClienteleAPI = "$server + admin/clientele/lead/";
  static String prospectClienteleAPI = "$server + admin/clientele/prospect/";


}