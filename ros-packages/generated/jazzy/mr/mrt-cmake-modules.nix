{
  ament-cmake-core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mrt_cmake_modules" = substituteSource {
      src = fetchgit {
        name = "mrt_cmake_modules-source";
        url = "https://github.com/ros2-gbp/mrt_cmake_modules-release.git";
        rev = "594a0a1eeaf421f36e68f2912c1d1c7368d44ae0";
        hash = "sha256-P+/sA/qc4KidP4Kzg1VSvYisUOmLdM7Y7gvrVm87rp8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrt_cmake_modules";
  version = "1.0.11-2";
  src = sources."mrt_cmake_modules";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gtest-vendor ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "lcov" "python3-catkin-pkg-modules" "python3-rospkg" "python3-setuptools" "python3-yaml" ]; };
  buildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gtest-vendor ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lcov" "python3-catkin-pkg-modules" "python3-rospkg" "python3-setuptools" "python3-yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake Functions and Modules for automating CMake";
  };
}
