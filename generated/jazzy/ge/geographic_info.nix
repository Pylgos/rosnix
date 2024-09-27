{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    geographic_info-95889c879210cdd9d936dce1750a8cdac4036071 = substituteSource {
      src = fetchgit {
        name = "geographic_info-95889c879210cdd9d936dce1750a8cdac4036071-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "95889c879210cdd9d936dce1750a8cdac4036071";
        hash = "sha256-9v0PhFwY4GRy9FH7XCYu+48GcNisf9Hg2093eaFWEKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geographic_info";
  version = "1.0.6-2";
  src = sources.geographic_info-95889c879210cdd9d936dce1750a8cdac4036071;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geodesy geographic_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Geographic information metapackage. Not needed for wet packages, use only to resolve dry stack dependencies.";
  };
}
