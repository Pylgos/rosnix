{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    curl-vendor_source-801bd5138ce31aa0d906fa4e2eabfc599d74e793 = substituteSource {
      src = fetchgit {
        name = "curl-vendor_source-801bd5138ce31aa0d906fa4e2eabfc599d74e793-source";
        url = "https://github.com/curl/curl.git";
        rev = "801bd5138ce31aa0d906fa4e2eabfc599d74e793";
        hash = "sha256-4w15NHw3D+YBuK02ZIZqvGaWgyQVc61MZ34pkLu0Oug=";
      };
      substitutions = [
      ];
    };
    libcurl_vendor-21f597630799e54afc2ba279715729c2562f35e6 = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-21f597630799e54afc2ba279715729c2562f35e6-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "21f597630799e54afc2ba279715729c2562f35e6";
        hash = "sha256-BfR9gU8jdd2P7nCPNEa2+sCLgCrXMLNqP4gp13pNpIs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/curl/curl.git";
          to = "VCS_TYPE path VCS_URL ${curl-vendor_source-801bd5138ce31aa0d906fa4e2eabfc599d74e793}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "libcurl_vendor";
  version = "3.5.1-1";
  src = sources.libcurl_vendor-21f597630799e54afc2ba279715729c2562f35e6;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "file" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around libcurl, it provides a fixed CMake module and an ExternalProject build of it.";
  };
}
