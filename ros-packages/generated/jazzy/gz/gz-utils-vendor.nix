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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_utils_vendor";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."gz_utils_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-utils2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-utils2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_utils_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_utils_vendor-source";
        url = "https://github.com/ros2-gbp/gz_utils_vendor-release.git";
        rev = "703bec3b307c5820d6b866a9953f55a209b5cea9";
        hash = "sha256-JDGjZPW0fqbfXE9aP9VBknxushfPM5s9XN+AampmARo=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_utils_vendor/gz-utils"}";
        }
      ];
    };
    "gz_utils_vendor/gz-utils" = substituteSource {
      src = fetchgit {
        name = "gz-utils-source";
        url = "https://github.com/gazebosim/gz-utils.git";
        rev = "513b36e6323b4ceb4b49d832dc7d163331e1cd11";
        hash = "sha256-utVW8pTP/emEWblTxVb6jzulKdxss+2VfS552MWMqm4=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-utils2 2.2.1\n\n    Gazebo Utils : Classes and functions for robot applications\n  ";
  };
})
