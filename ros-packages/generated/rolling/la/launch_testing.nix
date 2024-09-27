{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_xml,
  launch_yaml,
  osrf_pycommon,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    launch_testing-4fb8b8b075cfde8ceeefe6d3b9824c958a008a5d = substituteSource {
      src = fetchgit {
        name = "launch_testing-4fb8b8b075cfde8ceeefe6d3b9824c958a008a5d-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "4fb8b8b075cfde8ceeefe6d3b9824c958a008a5d";
        hash = "sha256-rm7tikgeZVe6xMX1+PrCXbcZUnxAABhTumfoJY2+7YM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing";
  version = "3.6.1-1";
  src = sources.launch_testing-4fb8b8b075cfde8ceeefe6d3b9824c958a008a5d;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
}
