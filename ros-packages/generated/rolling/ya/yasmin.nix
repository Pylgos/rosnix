{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin";
  version = "4.2.4-1";
  src = finalAttrs.passthru.sources."yasmin";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin" = substituteSource {
      src = fetchgit {
        name = "yasmin-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "6d08e3f69ae44400ef07e11e8c871962782888b0";
        hash = "sha256-RwjO6mAm2iVoVzYES7y4HdL/K88vPcwJ7hDOVU85fmQ=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) main package";
  };
})
