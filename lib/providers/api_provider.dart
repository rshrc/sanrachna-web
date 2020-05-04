import 'package:sanrachna_web/models/associate_model.dart';
import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/models/prospect_model.dart';

abstract class AssociateAPIProvider {
  Future<List<AssociateModel>> getLabours();

  Future<List<AssociateModel>> getSupervisors();

  Future<List<AssociateModel>> getVendors();

  Future<String> addLabour();

  Future<String> addSupervisor();

  Future<String> addVendors();

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

abstract class DatabaseAPIProvider {
  Future<List<MaterialModel>> getMaterials();

  Future<String> getServices();

  Future<String> addMaterial();

  Future<String> addService();

  Future<String> deleteMaterial();

  Future<String> deleteService();
}

abstract class ProspectAPIProvider {
  Future<List<ProspectModel>> getProspects();

  Future<String> addProspect();

  Future<String> deleteProspect();
}
