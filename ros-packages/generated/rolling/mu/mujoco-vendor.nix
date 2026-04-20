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
  version = "0.0.8-2";
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
        rev = "5e6349340a83363bcbd8332be28665c79cb20369";
        hash = "sha256-/2htgPTYAUVkrjphSY7YAQ7+42vCcY0tGHrMXiDT65w=";
      };
    };
  });
  meta = {
    description = "Vendor package for MuJoCo simulator of version 3.4.0";
  };
})
