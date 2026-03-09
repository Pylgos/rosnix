{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_vendor";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mujoco_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "patchelf" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" "patchelf" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mujoco_vendor" = substituteSource {
      src = fetchgit {
        name = "mujoco_vendor-source";
        url = "https://github.com/ros2-gbp/mujoco_vendor-release.git";
        rev = "50fe51cb32e5ba7ef364a44a5c59c3b86be58474";
        hash = "sha256-cuJcegYEueffq7gjgHHfymzpSTengmDnL+2qXB8cm+U=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"\${MUJOCO_ASSET_URL}\"";
          to = "URL ${sources."mujoco_vendor/mujoco-3"}";
        }
      ];
    };
    "mujoco_vendor/mujoco-3" = substituteSource {
      src = fetchzip {
        name = "mujoco-3-source";
        url = "https://github.com/google-deepmind/mujoco/releases/download/3.4.0/mujoco-3.4.0-windows-x86_64.zip";
        hash = "sha256-6rWhc0Ljuq6jBJyIfi3gKadidBOTsO0QH+IwwSQL1N8=";
      };
    };
  });
  meta = {
    description = "Vendor package for MuJoCo simulator of version 3.4.0";
  };
})
