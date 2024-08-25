{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  file,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libcurl_vendor = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "21f597630799e54afc2ba279715729c2562f35e6";
        hash = "sha256-BfR9gU8jdd2P7nCPNEa2+sCLgCrXMLNqP4gp13pNpIs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/curl/curl.git";
          to = "VCS_TYPE path VCS_URL ${libcurl_vendor-vendor_source-curl-0}";
        }
      ];
    };
    libcurl_vendor-vendor_source-curl-0 = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-vendor_source-curl-0-source";
        url = "https://github.com/curl/curl.git";
        rev = "801bd5138ce31aa0d906fa4e2eabfc599d74e793";
        hash = "sha256-4w15NHw3D+YBuK02ZIZqvGaWgyQVc61MZ34pkLu0Oug=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcurl_vendor";
  version = "3.5.1-1";
  src = sources.libcurl_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ curl pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ file ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around libcurl, it provides a fixed CMake module and an ExternalProject build of it.";
  };
}
