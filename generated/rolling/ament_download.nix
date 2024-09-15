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
    ament_download = substituteSource {
      src = fetchgit {
        name = "ament_download-source";
        url = "https://github.com/ros2-gbp/ament_download-release.git";
        rev = "ed8a03857e6995f4b54e7bcf8a02333a14811f80";
        hash = "sha256-6V9DhJraMIbNz3xeSeczpOFyaWgBqKsz2vQV4jFl6qk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_download";
  version = "0.0.5-5";
  src = sources.ament_download;
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
