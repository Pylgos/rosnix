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
    libcurl_vendor-e223cb19353802a673a50fa06be2b1cf48452255 = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-e223cb19353802a673a50fa06be2b1cf48452255-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "e223cb19353802a673a50fa06be2b1cf48452255";
        hash = "sha256-v0iNPURg6MEcVD010bSbeJ81E/2SNv2HQ97U/fcjz1A=";
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
  version = "3.4.3-1";
  src = sources.libcurl_vendor-e223cb19353802a673a50fa06be2b1cf48452255;
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
