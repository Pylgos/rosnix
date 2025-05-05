{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "iceoryx_hoofs";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."iceoryx_hoofs";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "acl" "libatomic" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "acl" "libatomic" ]; };
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_hoofs" = substituteSource {
      src = fetchgit {
        name = "iceoryx_hoofs-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "1798c560d532862fd1ff6dc4fe468643274f6e88";
        hash = "sha256-AwalGLCTTPSEJR6Y8BIk2pk3VUeYR6YqSO1GGJ7lh8g=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware basic building blocks";
  };
})
