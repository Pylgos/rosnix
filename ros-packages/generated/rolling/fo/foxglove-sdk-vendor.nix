{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foxglove_sdk_vendor";
  version = "0.2.0-3";
  src = finalAttrs.passthru.sources."foxglove_sdk_vendor";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "foxglove_sdk_vendor" = substituteSource {
      src = fetchgit {
        name = "foxglove_sdk_vendor-source";
        url = "https://github.com/ros2-gbp/foxglove_sdk_vendor-release.git";
        rev = "d49fe68296689e1b1b11d8df75885f8ff95f0247";
        hash = "sha256-wcbqttV5jRPw1KYQXu75EOapTjuLZFN8zCVKKXuAnE0=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package that fetches prebuilt Foxglove SDK archives and exposes the headers\n    and libfoxglove.a static library to ROS 2 workspaces.\n  ";
  };
})
