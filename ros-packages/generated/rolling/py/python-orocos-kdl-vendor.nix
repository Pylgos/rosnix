{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  pybind11-vendor,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_orocos_kdl_vendor";
  version = "0.8.0-1";
  src = finalAttrs.passthru.sources."python_orocos_kdl_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ orocos-kdl-vendor pybind11-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pykdl" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ orocos-kdl-vendor pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_orocos_kdl_vendor" = substituteSource {
      src = fetchgit {
        name = "python_orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "cf6f9112b66105d8e013b4040acb2361e1ab06c7";
        hash = "sha256-H1iBNODJiZ4wUMvKRnCS+5vBtVGcmDSlvKWJEBPEYn4=";
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
    };
  });
  meta = {
    description = "\n    Wrapper around PyKDL, providing nothing but a dependency on PyKDL on some systems.\n    On others, it fetches and builds python_orocos_kdl locally.\n  ";
  };
})
