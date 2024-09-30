{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros-py,
}:
let
  sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "55111bd8781b5b13d3eeea80100d9c59094ceebf";
        hash = "sha256-KGW8WTZeZQzYF2ZWxyTQDp8Kri5r0ZNASo6rHjm3+L8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "examples_tf2_py";
  version = "0.38.2-1";
  src = sources."examples_tf2_py";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Has examples of using the tf2 Python API.";
  };
}
