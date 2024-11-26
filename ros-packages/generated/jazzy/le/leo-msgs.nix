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
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."leo_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "leo_msgs" = substituteSource {
        src = fetchgit {
          name = "leo_msgs-source";
          url = "https://github.com/ros2-gbp/leo_common-release.git";
          rev = "e29e4cfae01ff153a9745b2836900884b007207a";
          hash = "sha256-/NlSo70CW4CXaWeELJSZuBtPzi3tcWsLc90frzePkpA=";
        };
      };
    });
  };
  meta = {
    description = "Message and Service definitions for Leo Rover";
  };
})
