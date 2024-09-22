{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  rosSystemPackages,
  sick_safevisionary_driver,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_tests = substituteSource {
      src = fetchFromGitHub {
        name = "sick_safevisionary_tests-source";
        owner = "ros2-gbp";
        repo = "sick_safevisionary_ros2-release";
        rev = "b65cb75ceb9c334712556b496bec8b5e36f089ec";
        hash = "sha256-Q8HR5ihqZXIb5vP+goYKCgxgf635GsyPBnh2t5oPkgI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_tests";
  version = "1.0.3-3";
  src = sources.sick_safevisionary_tests;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ launch launch_ros launch_testing_ament_cmake sick_safevisionary_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Integration tests for the Sick SafeVisionary2 driver";
  };
}
