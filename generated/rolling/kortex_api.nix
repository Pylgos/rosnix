{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kortex_api = substituteSource {
      src = fetchgit {
        name = "kortex_api-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "66ae91768108094050308c8d947e26cb0488c197";
        hash = "sha256-UFMEHMDlJ46OSmSxOWPLgoOcCND8kWd+9gzBtSJQCXw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${kortex_api-vendor_source-linux_x86-64_x86_gcc-0}";
        }
      ];
    };
    kortex_api-vendor_source-linux_x86-64_x86_gcc-0 = substituteSource {
      src = fetchzip {
        name = "kortex_api-vendor_source-linux_x86-64_x86_gcc-0-source";
        url = "https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
        hash = "sha256-+fUMtXCoThItleO1C2jTZfK6DP/Z7dVJx26WWbBQ9Uc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kortex_api";
  version = "0.2.2-2";
  src = sources.kortex_api;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "kortex_api";
  };
}
