{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-math-vendor,
  gz-tools-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_msgs_vendor";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."gz_msgs_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-msgs11" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-msgs11" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_msgs_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "eb0d9f5669415b69049a56a0217fe11aa01957b9";
        hash = "sha256-J3TqLFAmIJTKEIr22puvgftLwKgViaFQM37uXzloo9M=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_msgs_vendor/gz-msgs"}";
        }
      ];
    };
    "gz_msgs_vendor/gz-msgs" = substituteSource {
      src = fetchgit {
        name = "gz-msgs-source";
        url = "https://github.com/gazebosim/gz-msgs.git";
        rev = "1f5f19e44faaaa8ece97903eb09b685b4640dea1";
        hash = "sha256-M/rzUrL6uzpaRNLWJsGViY6Jk0bLtooEe+0eEEPS7PA=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-msgs11 11.1.0\n\n    Gazebo Messages: Protobuf messages and functions for robot applications\n  ";
  };
})
