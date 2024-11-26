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
  version = "3.0.3-2";
  src = finalAttrs.passthru.sources."smach_msgs";
  nativeBuildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-pep257 rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cpplint ament-cmake-uncrustify ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "smach_msgs" = substituteSource {
      src = fetchgit {
        name = "smach_msgs-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "83933fda82d1988b25b47aa3772f208274fa1f2b";
        hash = "sha256-GO/kVPGJMyEujXHxScev2o0WXzzzWX0rZHWTMJTPCwg=";
      };
    };
  });
  meta = {
    description = "this package contains a set of messages that are used by the introspection interfaces for smach.";
  };
})
