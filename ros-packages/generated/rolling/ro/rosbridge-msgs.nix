{
  ament-cmake-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosbridge_msgs";
  nativeBuildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbridge_msgs" = substituteSource {
        src = fetchgit {
          name = "rosbridge_msgs-source";
          url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
          rev = "5b42da05d35438cbb5ae71cfd71d01cfe4950540";
          hash = "sha256-n0NfnKAP54imKsEYIC2iKe9aQBO+PBLhKwv+QHECWGA=";
        };
      };
    });
  };
  meta = {
    description = "Package containing message files";
  };
})
