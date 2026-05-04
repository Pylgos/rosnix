{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_msgs";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."yasmin_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_msgs" = substituteSource {
      src = fetchgit {
        name = "yasmin_msgs-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "ae67bb4d6e24c77f31b6ecc7717f8c39f0d40c69";
        hash = "sha256-phG2hAg0QElrDdlqgxq340x0x1f+H4hGpLSDYrXCwoM=";
      };
    };
  });
  meta = {
    description = "Msgs of (Yet Another State MachINe)";
  };
})
