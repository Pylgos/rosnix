{
  ament-cmake,
  ament-cmake-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-typesupport-c,
  rosidl-typesupport-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_core_generators";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."rosidl_core_generators";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cmake rosidl-typesupport-c rosidl-typesupport-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-cmake rosidl-typesupport-c rosidl-typesupport-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_core_generators" = substituteSource {
      src = fetchgit {
        name = "rosidl_core_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "62f67614887b74e5113af1e9822f88987dabb0b8";
        hash = "sha256-+2mGzmeKEGs/LWlZMaPRP4ZuXmiBw9Qz+SrqehDu/kw=";
      };
    };
  });
  meta = {
    description = "A configuration package defining core ROS interface generators.";
  };
})
