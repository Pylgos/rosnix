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
  version = "0.2.7-1";
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
        rev = "c242ebd160fa5b3380bb495db3f22901e837e71c";
        hash = "sha256-0IhT7KQkrVtKHzvDCp4AnNIYHujdKdrA5jh7UFykkrk=";
      };
    };
  });
  meta = {
    description = "Protobuf definitions for SYNC.TOOLING";
  };
})
