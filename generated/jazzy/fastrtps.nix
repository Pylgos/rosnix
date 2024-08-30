{
  asio,
  buildRosPackage,
  cmake,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  foonathan_memory_vendor,
  openssl,
  python3,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    fastrtps = substituteSource {
      src = fetchgit {
        name = "fastrtps-source";
        url = "https://github.com/ros2-gbp/fastrtps-release.git";
        rev = "2ed4a01f31f5e04860e4e24fedc8a4a1012a282f";
        hash = "sha256-wECFJjYb5fz4u/B375jBBUkB8xQ1njY3pIcc8pixN9g=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://fast-dds.docs.eprosima.com/_/downloads/en/latest/htmlzip/\"";
          to = "DOWNLOAD file://${fastrtps-vendor_source--0}";
        }
      ];
    };
    fastrtps-vendor_source--0 = substituteSource {
      src = fetchurl {
        name = "fastrtps-vendor_source--0-source";
        url = "https://fast-dds.docs.eprosima.com/_/downloads/en/latest/htmlzip/";
        hash = "sha256-I8h3ZHK0K61uC+ODhn6sDUk4EMqMxR9CF8Ajd3ADIJA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps";
  version = "2.14.1-1";
  src = sources.fastrtps;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio fastcdr foonathan_memory_vendor openssl python3 tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "*eprosima Fast DDS* (formerly Fast RTPS) is a C++ implementation of the DDS (Data Distribution Service) standard of the OMG (Object Management Group). eProsima Fast DDS implements the RTPS (Real Time Publish Subscribe) protocol, which provides publisher-subscriber communications over unreliable transports such as UDP, as defined and maintained by the Object Management Group (OMG) consortium. RTPS is also the wire interoperability protocol defined for the Data Distribution Service (DDS) standard. *eProsima Fast DDS* expose an API to access directly the RTPS protocol, giving the user full access to the protocol internals.";
  };
}
