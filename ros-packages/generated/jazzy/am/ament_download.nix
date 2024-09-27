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
    ament_download-6ce6469292c63e6bc20f3e38a9062b0a027f92e4 = substituteSource {
      src = fetchgit {
        name = "ament_download-6ce6469292c63e6bc20f3e38a9062b0a027f92e4-source";
        url = "https://github.com/ros2-gbp/ament_download-release.git";
        rev = "6ce6469292c63e6bc20f3e38a9062b0a027f92e4";
        hash = "sha256-6V9DhJraMIbNz3xeSeczpOFyaWgBqKsz2vQV4jFl6qk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_download";
  version = "0.0.5-6";
  src = sources.ament_download-6ce6469292c63e6bc20f3e38a9062b0a027f92e4;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake macros for downloading files with ament";
  };
}
