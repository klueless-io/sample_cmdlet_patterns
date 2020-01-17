#include "sample_cmdlet_patterns.h"

VALUE rb_mSampleCmdletPatterns;

void
Init_sample_cmdlet_patterns(void)
{
  rb_mSampleCmdletPatterns = rb_define_module("SampleCmdletPatterns");
}
