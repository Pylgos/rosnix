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
    tl_expected-3479d38bf922bc4f11b60037fc66ab64e31a70f2 = substituteSource {
      src = fetchgit {
        name = "tl_expected-3479d38bf922bc4f11b60037fc66ab64e31a70f2-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "3479d38bf922bc4f11b60037fc66ab64e31a70f2";
        hash = "sha256-MRDjBU0WqHHPomrtLuNox0zVGvy6aMGTGO8WBV04bF8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tl_expected";
  version = "1.0.2-4";
  src = sources.tl_expected-3479d38bf922bc4f11b60037fc66ab64e31a70f2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++11/14/17 std::expected with functional-style extensions";
  };
}
