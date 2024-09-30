{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  pybind11-vendor,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "python_orocos_kdl_vendor" = substituteSource {
      src = fetchgit {
        name = "python_orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "d1d43bdb1c1352d9e431c857e7bc6537c2ff680b";
        hash = "sha256-vl1eKkJp/P4mQsOWDBIWnCOpp/m2LB18yxZI9GWgaYY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
          to = "URL ${sources."python_orocos_kdl_vendor/ce4bcb65a050615b6d7f21bc60fbb2656515791b"}";
        }
      ];
    };
    "python_orocos_kdl_vendor/ce4bcb65a050615b6d7f21bc60fbb2656515791b" = substituteSource {
      src = fetchzip {
        name = "ce4bcb65a050615b6d7f21bc60fbb2656515791b-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
        hash = "sha256-JXNOS6uV6ls3eMI53sBkX+zJfiVUakbK6iLlzPlD1+8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "python-orocos-kdl-vendor";
  version = "0.5.1-2";
  src = sources."python_orocos_kdl_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ orocos-kdl-vendor pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around PyKDL, providing nothing but a dependency on PyKDL on some systems. On others, it fetches and builds python_orocos_kdl locally.";
  };
}