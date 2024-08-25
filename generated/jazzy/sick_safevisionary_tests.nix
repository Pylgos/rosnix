{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  sick_safevisionary_driver,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_tests = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_tests-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ launch launch_ros launch_testing_ament_cmake sick_safevisionary_driver ];
  missingDependencies = [  ];
  meta = {
    description = "Integration tests for the Sick SafeVisionary2 driver";
  };
}
