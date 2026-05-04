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
  version = "0.2.7-2";
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
        rev = "a7efa8d95dbe5d124ddf31a02e56b21baeb8b1c2";
        hash = "sha256-0IhT7KQkrVtKHzvDCp4AnNIYHujdKdrA5jh7UFykkrk=";
      };
    };
  });
  meta = {
    description = "Protobuf definitions for SYNC.TOOLING";
  };
})
