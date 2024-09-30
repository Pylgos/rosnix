{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pybind11-vendor,
  rclcpp,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "py_binding_tools" = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros-gbp/py_binding_tools-release.git";
        rev = "6bbf5eea730e839c4edc430134463a29759f9a99";
        hash = "sha256-ptJcdfTt1QQXFPCJ4R1QqIIcwEOHo+ay+T7OJqwDAYo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "py_binding_tools";
  version = "2.0.1-1";
  src = sources."py_binding_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs pybind11-vendor rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python binding tools for C++";
  };
}
