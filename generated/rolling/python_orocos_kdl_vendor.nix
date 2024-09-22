{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
    python_orocos_kdl_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "python_orocos_kdl_vendor-source";
        owner = "ros2-gbp";
        repo = "orocos_kdl_vendor-release";
        rev = "573fe19a96d05b976e2d7734a5f7dc0c09077601";
        hash = "sha256-V3BBOQVqhrrQUHacG4mKlmLmCaiIq1uYPc7qgwem+2s=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
          to = "URL ${python_orocos_kdl_vendor-vendor_source-ce4bcb65a050615b6d7f21bc60fbb2656515791b-0}";
        }
      ];
    };
    python_orocos_kdl_vendor-vendor_source-ce4bcb65a050615b6d7f21bc60fbb2656515791b-0 = substituteSource {
      src = fetchzip {
        name = "python_orocos_kdl_vendor-vendor_source-ce4bcb65a050615b6d7f21bc60fbb2656515791b-0-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
        hash = "sha256-JXNOS6uV6ls3eMI53sBkX+zJfiVUakbK6iLlzPlD1+8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_orocos_kdl_vendor";
  version = "0.6.1-1";
  src = sources.python_orocos_kdl_vendor;
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
