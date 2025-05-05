{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-lint,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "smach_msgs";
  version = "3.0.3-3";
  src = finalAttrs.passthru.sources."smach_msgs";
  nativeBuildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-pep257 rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-pep257 rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cpplint ament-cmake-uncrustify ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "smach_msgs" = substituteSource {
      src = fetchgit {
        name = "smach_msgs-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "e4906ce6c6e13e5c028b738e8f00b7b518a5d76e";
        hash = "sha256-GO/kVPGJMyEujXHxScev2o0WXzzzWX0rZHWTMJTPCwg=";
      };
    };
  });
  meta = {
    description = "\n    this package contains a set of messages that are used by the introspection\n    interfaces for smach.\n  ";
  };
})
