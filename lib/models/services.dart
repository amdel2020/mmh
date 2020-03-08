enum ServiceType { FULLTIME, PARTTIME, ONDEMAND }

class Service {
  final ServiceType serviceType;
  final String header;
  final String description;

  Service({this.header, this.description, this.serviceType});
}

class ServiceData {
  List<Service> _services;

  ServiceData() {
    _services = _getData();
  }

  List<Service> _getData() {
    List<Service> result = List<Service>();
    result.add(Service(
        description: 'Our full time service',
        header: 'FULL TIME',
        serviceType: ServiceType.FULLTIME));
    
    result.add(Service(
        description: 'Our part time service',
        header: 'PART TIME',
        serviceType: ServiceType.PARTTIME));
    
    result.add(Service(
        description: 'Our on demand service',
        header: 'ON DEMAND',
        serviceType: ServiceType.ONDEMAND));
      
    return result;
  }

  List<Service> get serviceData => _services;
}
