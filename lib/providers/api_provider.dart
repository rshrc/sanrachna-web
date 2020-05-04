import 'package:sanrachna_web/models/associate_model.dart';
import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:sanrachna_web/models/service_model.dart';

abstract class AssociateAPIProvider {
  Future<List<AssociateModel>> getLabours();

  Future<List<AssociateModel>> getSupervisors();

  Future<List<AssociateModel>> getVendors();

  Future<String> addLabour({
    String fullName,
    String organization,
    String mobileNumber,
    String email,
  });

  Future<String> addSupervisor({
    String fullName,
    String organization,
    String mobileNumber,
    String email,
  });

  Future<String> addVendors({
    String fullName,
    String organization,
    String mobileNumber,
    String email,
  });

  Future<String> deleteLabour(int id);

  Future<String> deleteSupervisor(int id);

  Future<String> deleteVendor(int id);
}

abstract class ClientaleAPIProvider {
  Future<List<ClienteleModel>> getClients();

  Future<List<ClienteleModel>> getLeads();

  Future<List<ClienteleModel>> getProspects();

  Future<String> addClient();

  Future<String> addLead();

  Future<String> addProspect();

  Future<String> deleteClient(int id);

  Future<String> deleteLead(int id);

  Future<String> deleteProspect(int id);
}

abstract class MaterialAPIProvider {
  Future<List<MaterialModel>> getTiles();

  Future<String> addTiles();

  Future<String> deleteTiles();

  Future<List<MaterialModel>> getCivil();

  Future<String> addCivil();

  Future<String> deleteCivil();

  Future<List<MaterialModel>> getElectric();

  Future<String> addElectric();

  Future<String> deleteElectric();

  Future<List<MaterialModel>> getPaint();

  Future<String> addPaint();

  Future<String> deletePaint();

  Future<List<MaterialModel>> getPlumbing();

  Future<String> addPlumbing();

  Future<String> deletePlumbing();

  Future<List<MaterialModel>> getPly();

  Future<String> addPly();

  Future<String> deletePly();
}

abstract class ProspectAPIProvider {
  Future<List<ProspectModel>> getProspects();

  Future<String> addProspect({
    String fullName,
    String organization,
    String email,
    String mobileNumber,
    String siteType,
    String sourceType,
  });

  Future<String> deleteProspect();
}

abstract class ServiceAPIProvider {
  Future<List<ServiceModel>> getServices();

  Future<String> addServices();

  Future<String> deleteServices();
}
