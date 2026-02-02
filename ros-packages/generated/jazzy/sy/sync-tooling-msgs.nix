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
  pname = "sync_tooling_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."sync_tooling_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "protobuf-dev" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "protobuf" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "protobuf-dev" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "protobuf" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sync_tooling_msgs" = substituteSource {
      src = fetchgit {
        name = "sync_tooling_msgs-source";
        url = "https://github.com/ros2-gbp/sync_tooling_msgs-release.git";
        rev = "82dc70cb190610dc598902105a5cbc7277bca9b3";
        hash = "sha256-CU1sHEF+mvOHoVBOqlQabNgNhxLSAYyrPd1Or5wcHgo=";
      };
    };
  });
  meta = {
    description = "Protobuf definitions for synchronization diagnostics";
  };
})
