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
  version = "0.4.3-1";
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
        rev = "d7c5b1165e7228749dbb37e87a4ceaf3a159ea3e";
        hash = "sha256-+ezGeAbqcs/a4FBAi5QnpRzumGky1x0H/ANM5oRcOhI=";
      };
    };
  });
  meta = {
    description = "A configuration package defining core ROS interface generators.";
  };
})
