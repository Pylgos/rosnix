{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
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
  pname = "leo_msgs";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."leo_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_msgs" = substituteSource {
      src = fetchgit {
        name = "leo_msgs-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "2c43fcac7fbd2eb73a20aaa6cfb273b60ed0aa89";
        hash = "sha256-sXiMSsfTjgdxjO/akTTMgVO9nP50z0mfvcJP242J2tk=";
      };
    };
  });
  meta = {
    description = "Message and Service definitions for Leo Rover";
  };
})
