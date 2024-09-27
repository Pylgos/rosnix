{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  pybind11_vendor,
  python_cmake_module,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ce4bcb65a050615b6d7f21bc60fbb2656515791b-vendor_source-1vyp8gwwrr92xb54csjl4mzckv2zck0dwff2g0vmpslmmd5lwwr5 = substituteSource {
      src = fetchzip {
        name = "ce4bcb65a050615b6d7f21bc60fbb2656515791b-vendor_source-1vyp8gwwrr92xb54csjl4mzckv2zck0dwff2g0vmpslmmd5lwwr5-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
        hash = "sha256-JXNOS6uV6ls3eMI53sBkX+zJfiVUakbK6iLlzPlD1+8=";
      };
      substitutions = [
      ];
    };
    python_orocos_kdl_vendor-d1d43bdb1c1352d9e431c857e7bc6537c2ff680b = substituteSource {
      src = fetchgit {
        name = "python_orocos_kdl_vendor-d1d43bdb1c1352d9e431c857e7bc6537c2ff680b-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "d1d43bdb1c1352d9e431c857e7bc6537c2ff680b";
        hash = "sha256-vl1eKkJp/P4mQsOWDBIWnCOpp/m2LB18yxZI9GWgaYY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
          to = "URL ${ce4bcb65a050615b6d7f21bc60fbb2656515791b-vendor_source-1vyp8gwwrr92xb54csjl4mzckv2zck0dwff2g0vmpslmmd5lwwr5}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "python_orocos_kdl_vendor";
  version = "0.5.1-2";
  src = sources.python_orocos_kdl_vendor-d1d43bdb1c1352d9e431c857e7bc6537c2ff680b;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ orocos_kdl_vendor pybind11_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around PyKDL, providing nothing but a dependency on PyKDL on some systems. On others, it fetches and builds python_orocos_kdl locally.";
  };
}
